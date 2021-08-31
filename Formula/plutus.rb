class Plutus < Formula
  desc "plutus-cli from source"
  homepage "https://better.com"
  version "1.6.1"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-darwin-x64.tar.gz"
    sha256 "f711a36ef4c3a551e7de1cc7e1edaf86c7c87f3fe69940f078b15bf5050ec417"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-linux-x64.tar.gz"
    sha256 "3c58cd8224ac0155bbda8abfcea13045f4b826a1c246c6a81c1aa27b6bc669c7"
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
