class Plutus < Formula
  desc "plutus-cli"
  homepage "https://better.com"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v0.28.7/plutus-v0.28.7-darwin-x64.tar.gz"
    sha256 "b0f5a1f17026bd9d675ae63921d750c69f136a846ad2fc181859654d79f18e7a"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v0.28.7/plutus-v0.28.7-linux-x64.tar.gz"
    sha256 "94d3e65c21c5cfa8a200134035793bfcb192c332a86b2da1687116612fe8b7ef"
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
