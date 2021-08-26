class Plutus < Formula
  desc "plutus-cli from source"
  homepage "https://better.com"
  version "1.1.2"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-darwin-x64.tar.gz"
    sha256 "6f9f630987f70ab92811aee90943d14fcb3f57fe1dea752172b96a8cb1e64c05"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-linux-x64.tar.gz"
    sha256 "4f76cab51ca66bdbdf3651522e98effed99faff115f8014872f9ee11d4d4f4a7"
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
