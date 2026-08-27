class Plutus < Formula
  desc "plutus-cli from source"
  homepage "https://better.com"
  version "7.0.0"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/versions/7.0.0/56d574a10/plutus-v7.0.0-56d574a10-darwin-arm64.tar.gz"
    sha256 "2a2f06fe45e44757f1bc5b37341f746b8c4f137dcafd42301333ed2e0fabcdbd"
  end

  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/versions/7.0.0/56d574a10/plutus-v7.0.0-56d574a10-linux-x64.tar.gz"
    sha256 "dd10f7a7d75b6a54feeed9f570a931f484800a84a89a07ccc753caf50fe41d29"
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
