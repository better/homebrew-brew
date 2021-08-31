class Plutus < Formula
  desc "plutus-cli from source"
  homepage "https://better.com"
  version "1.6.0"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-darwin-x64.tar.gz"
    sha256 "a86e7b03894b7c2f228db6a8bfeb0818a77bcf1ccf3d3ebf16490bf9c1ccb6fe"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-linux-x64.tar.gz"
    sha256 "0db08fe32f6d0b959a22dcb87af73953d657e03445f660a2c609fb428da17c40"
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
