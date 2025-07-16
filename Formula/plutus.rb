class Plutus < Formula
  desc "plutus-cli from source"
  homepage "https://better.com"
  version "2.6.1"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-darwin-x64.tar.gz"
    sha256 "165963eafa81302e4f1bc0748f6818c68632223c969fd9f0483e6e3e2cfb97b0"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-linux-x64.tar.gz"
    sha256 "9aa522e633c9a05c0388b26ca84c99f4ab238e8fae12503cdc8865a0cc6c92da"
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
