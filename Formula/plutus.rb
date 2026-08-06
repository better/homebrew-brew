class Plutus < Formula
  desc "plutus-cli from source"
  homepage "https://better.com"
  version "5.0.0"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/versions/5.0.0/da3b24b3b/plutus-v5.0.0-da3b24b3b-darwin-x64.tar.gz"
    sha256 "59e5904ef2fbd2d88ebb98328e49c446105ebea209104e713c29bb2be27cf1e1"
  end

  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/versions/5.0.0/da3b24b3b/plutus-v5.0.0-da3b24b3b-linux-x64.tar.gz"
    sha256 "95c5207a4bbb64fde0bbb663f2cc9d3abe0fd0325e5025cc77e41770073defa7"
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
