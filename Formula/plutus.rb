class Plutus < Formula
  desc "plutus-cli"
  homepage "https://better.com"
  version "0.45.2"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-darwin-x64.tar.gz"
    sha256 "2e9bdade1512b0eb75f8bfcbb200df2a75f423957c4d4738be4ae18d2a26d763"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-linux-x64.tar.gz"
    sha256 "cc386935147d24d9c215c20a787d2e72eb6cc9eaec723a7184a43647c3f3e6ca"
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
