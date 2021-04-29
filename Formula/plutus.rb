class Plutus < Formula
  desc "plutus-cli"
  homepage "https://better.com"
  version "0.43.4"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-darwin-x64.tar.gz"
    sha256 "59e0f31f2c9991616a62c4cdb3b47d5bbfd0a0337a26401f4390b502d191fa5d"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-linux-x64.tar.gz"
    sha256 "87a49d3e1cf90729c5b77bd42c7f8eb74e95941e661d25f52b1115b36b7b09f2"
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
