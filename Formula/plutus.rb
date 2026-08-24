class Plutus < Formula
  desc "plutus-cli from source"
  homepage "https://better.com"
  version "6.1.0"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/versions/6.1.0/11d9d758c/plutus-v6.1.0-11d9d758c-darwin-x64.tar.gz"
    sha256 "f946c5bcadab2ff0d8c2d6cd3fb98369f0ebe838f6893f8cc0f13d8204b4f413"
  end

  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/versions/6.1.0/11d9d758c/plutus-v6.1.0-11d9d758c-linux-x64.tar.gz"
    sha256 "4a419fd7d242dc9eb680f4d4ed9c4acb1eb656cbb64f85e188049343de61939a"
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
