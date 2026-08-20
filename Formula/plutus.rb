class Plutus < Formula
  desc "plutus-cli from source"
  homepage "https://better.com"
  version "5.0.0"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/versions/5.0.0/ffbf75c62/plutus-v5.0.0-ffbf75c62-darwin-x64.tar.gz"
    sha256 "da3f7afe4187034ca81269cde880a41534d9e30b50bc922cd6f58b3c9896b762"
  end

  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/versions/5.0.0/ffbf75c62/plutus-v5.0.0-ffbf75c62-linux-x64.tar.gz"
    sha256 "816ac0a775e74a6e6d889e4e6dbd14c7529131dada30a112db343e240e0c8d8c"
  end

  depends_on "coreutils"
  depends_on "awscli"
  depends_on "jq"
  depends_on "npm"

  def install
    inreplace "bin/plutus", /^CLIENT_HOME=/, "export PLUTUS_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/plutus"
  end

  test do
    system bin/"plutus", "version"
  end
end
