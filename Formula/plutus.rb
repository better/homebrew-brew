class Plutus < Formula
  desc "plutus-cli from source"
  homepage "https://better.com"
  version "2.1.0"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-darwin-x64.tar.gz"
    sha256 "f81aeda02c12fe9ae0d192d6c67cebc98db309231af5f4f990086b9909124351"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-linux-x64.tar.gz"
    sha256 "77c8b127eea6b1d3136a5c39e0a0a4257785a6f2b7194b13f2c5d4249868dadb"
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
