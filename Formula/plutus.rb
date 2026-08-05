class Plutus < Formula
  desc "plutus-cli from source"
  homepage "https://better.com"
  version "5.0.0"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/versions/5.0.0/f34d61c4e/plutus-v5.0.0-f34d61c4e-darwin-x64.tar.gz"
    sha256 "b0d0ffe8d982b8ff8e1c3b4196c517f479a4753880a0c009b71cdfc7ce0eb8f6"
  end

  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/versions/5.0.0/f34d61c4e/plutus-v5.0.0-f34d61c4e-linux-x64.tar.gz"
    sha256 "38b7d9d8d3aa0843c036cd79f84524cfb23a6df23ebdcdec6096a7f9b8f3e3f9"
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
