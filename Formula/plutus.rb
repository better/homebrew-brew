class Plutus < Formula
  desc "plutus-cli from source"
  homepage "https://better.com"
  version "5.0.1"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/versions/5.0.1/ba855e018/plutus-v5.0.1-ba855e018-darwin-x64.tar.gz"
    sha256 "7ceec76f60a1b4c97bee934329217872a8f9418c16ca27fe1da11cb28ae798d8"
  end

  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/versions/5.0.1/ba855e018/plutus-v5.0.1-ba855e018-linux-x64.tar.gz"
    sha256 "878dfdf77d8cae3111fedfad18cb6cff95290fc2e9fb63e843f2452d00826850"
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
