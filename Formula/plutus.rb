class Plutus < Formula
  desc "plutus-cli from source"
  homepage "https://better.com"
  version "1.27.0"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-darwin-x64.tar.gz"
    sha256 "11bca8b3cdfeb9107ba0b4f0b8894a5e7ca08dafb727ce159e81c15f36ebefc6"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-linux-x64.tar.gz"
    sha256 "f3cfc106022954265f7b4efaff9cf754df4358d2636bc823d25c6ea741f71d4d"
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
