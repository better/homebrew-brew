class Plutus < Formula
  desc "plutus-cli from source"
  homepage "https://better.com"
  version "1.40.1"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-darwin-x64.tar.gz"
    sha256 "31fbf3157393fce6de1bd07511bc1a54021c89b83ca10765f30d194a8c54cc11"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-linux-x64.tar.gz"
    sha256 "3574312b8cd007693b6d50862a5ec20e062df918e0c2ed85eb1efa34eec911c4"
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
