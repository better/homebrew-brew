class Plutus < Formula
  desc "plutus-cli from source"
  homepage "https://better.com"
  version "2.6.0"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-darwin-x64.tar.gz"
    sha256 "cfc4b4d45a502554a2fc8bc214328ccb93ad34e21090d66c6c0ce6a102e778e6"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-linux-x64.tar.gz"
    sha256 "f05a9e35d512cf9bb4120071a3bb931e2ef9692036eefc641d51463b4f3fc044"
  end

  def install
    inreplace "bin/plutus", /^CLIENT_HOME=/, "export PLUTUS_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/plutus"
  end

  test do
    system bin/"plutus", "version"
  end
end
