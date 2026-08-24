class Plutus < Formula
  desc "plutus-cli from source"
  homepage "https://better.com"
  version "6.0.0"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/versions/6.0.0/45c29d1f2/plutus-v6.0.0-45c29d1f2-darwin-x64.tar.gz"
    sha256 "77febc5a10473da136447c0f3a5963914dc1e6c2844d2c226ef6b5ca7e6c98a8"
  end

  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/versions/6.0.0/45c29d1f2/plutus-v6.0.0-45c29d1f2-linux-x64.tar.gz"
    sha256 "f44cdaab06fdab32bd3e77228397ece17502c5bdaea1e779413c9b716250dd5a"
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
