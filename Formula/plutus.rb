class Plutus < Formula
  desc "plutus-cli from source"
  homepage "https://better.com"
  version "4.2.0"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-darwin-x64.tar.gz"
    sha256 "baeac723c6ef688b047f17a0866cde156d2f8a1d67f7299e80f0c30353e7997e"
  end

  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-linux-x64.tar.gz"
    sha256 "33c794fdcc86cc676a9a3e2d106436d0a45387a83d5ec17b2cd54165bb0c28d0"
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
