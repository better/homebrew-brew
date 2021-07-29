class Plutus < Formula
  desc "plutus-cli from source"
  homepage "https://better.com"
  version "0.58.1"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-darwin-x64.tar.gz"
    sha256 "da703e2503755ef999034d62f63a7c5d3ad11637617595d8dfcd138a8e6f2aec"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-linux-x64.tar.gz"
    sha256 "0dd93cdab2c6e8f7854fca472ec7b9465f81281b3c2fdde0fe8fbc4e73f6efb4"
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
