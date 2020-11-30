class Plutus < Formula
  desc "plutus-cli"
  homepage "https://better.com"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v0.25.5/plutus-v0.25.5-darwin-x64.tar.gz"
    sha256 "da0cf02fd68352516cb9b805c4650af68d18d96802e3cf9e4bcb55e31ed06121"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v0.25.5/plutus-v0.25.5-linux-x64.tar.gz"
    sha256 "4e82629a297c1c78608aa7f83e4fb7f55c3436e77b1869e9d5f6076e1ca29c9f"
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
