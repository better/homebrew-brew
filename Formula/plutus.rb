class Plutus < Formula
  desc "plutus-cli"
  homepage "https://better.com"
  version "0.38.0"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-darwin-x64.tar.gz"
    sha256 "ca60d49f8d80dadd02ebb3e8c5ed52a59b6d2761ab27cbb673223ad6d48b1a80"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-linux-x64.tar.gz"
    sha256 "6aef70ec42c79404f8028a1c48a31f2f9d9fc709d9e8ab4a2d83703bce3a5532"
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
