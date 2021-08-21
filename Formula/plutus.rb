class Plutus < Formula
  desc "plutus-cli from source"
  homepage "https://better.com"
  version "0.60.1"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-darwin-x64.tar.gz"
    sha256 "25b275b046a79afde78a185ebb3720ff7f96fc23d0c0b1d3ad9ead676154200a"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-linux-x64.tar.gz"
    sha256 "cbc33ebc18c2535fd451cfebfef5b0dfcefcdb3c8690ea14101fc346954b8c2c"
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
