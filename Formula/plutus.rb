class Plutus < Formula
  desc "plutus-cli from source"
  homepage "https://better.com"
  version "1.34.1"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-darwin-x64.tar.gz"
    sha256 "e978fab180c28fc1bc2ae8a20c2b52aec5044daf7ba15c2e4b5ab4994583788c"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-linux-x64.tar.gz"
    sha256 "6ee63cd135d1f0c9c0a6982330db67f51df9ed38f87079a1457ceaa5850e16dd"
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
