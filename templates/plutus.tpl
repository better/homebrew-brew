class Plutus < Formula
  desc "plutus-cli from source"
  homepage "https://better.com"
  version "$PLUTUS_VERSION"

  on_macos do
    url "$MACOS_GZ_URL"
    sha256 "$MACOS_GZ_SHA256"
  end

  on_linux do
    url "$LINUX_GZ_URL"
    sha256 "$LINUX_GZ_SHA256"
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
