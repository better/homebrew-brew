class Plutus < Formula
  desc "plutus-cli from source"
  homepage "https://better.com"
  version "4.4.0"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-darwin-x64.tar.gz"
    sha256 "939e4fcb9d7eb10a069e3fcb61515ee0f5a425df7bb6587bbd02bd24836dff3a"
  end

  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-linux-x64.tar.gz"
    sha256 "c4615d462a6bbe454936deeca16c8e9a30fb68e71e32405e0fc8d2d5707a4829"
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
