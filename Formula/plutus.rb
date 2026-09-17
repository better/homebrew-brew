class Plutus < Formula
  desc "plutus-cli from source"
  homepage "https://better.com"
  version "8.0.0"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/versions/8.0.0/8257888d6/plutus-v8.0.0-8257888d6-darwin-arm64.tar.gz"
    sha256 "1eac7e3061aa3af999620360f186fcd0101bd8f570910f8e2dde479c7852d489"
  end

  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/versions/8.0.0/8257888d6/plutus-v8.0.0-8257888d6-linux-x64.tar.gz"
    sha256 "0ca4b4e522349af1450ed47ab7bdf97f0f2f3fbf6acc45d45958aef057f29409"
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
