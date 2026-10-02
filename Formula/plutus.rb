class Plutus < Formula
  desc "plutus-cli from source"
  homepage "https://better.com"
  version "8.1.0"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/versions/8.1.0/966f61bfc/plutus-v8.1.0-966f61bfc-darwin-arm64.tar.gz"
    sha256 "1c0d6590cc5bd91e3e68743be964c290d3d8892ceb9054fc498e82c028263d5b"
  end

  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/versions/8.1.0/966f61bfc/plutus-v8.1.0-966f61bfc-linux-x64.tar.gz"
    sha256 "37dc652dd526a9f8cb54e855073f09641a91822d526f538a5a5dc78161530ec0"
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
