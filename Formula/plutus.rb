class Plutus < Formula
  desc "plutus-cli from source"
  homepage "https://better.com"
  version "1.9.4"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-darwin-x64.tar.gz"
    sha256 "f38d637aea9545a07c316860d745cf0eca8f0b1908b4f3cb6763cb1682cd9467"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-linux-x64.tar.gz"
    sha256 "9525b97ccf30cddbad162fbb6cc7a37da60d22073e228915d6cba25d948b8ecc"
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
