class Plutus < Formula
  desc "plutus-cli from source"
  homepage "https://better.com"
  version "0.57.7"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-darwin-x64.tar.gz"
    sha256 "4061a1d5f5d8d659bfcf8c41712e47c800ffc6b76b054b9dbacce2f15c20c707"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-linux-x64.tar.gz"
    sha256 "2ad67c3c5272f8f307d1a003bef9a487ac3e0cb43725fca95c77516c279b2ff1"
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
