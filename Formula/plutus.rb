class Plutus < Formula
  desc "plutus-cli from source"
  homepage "https://better.com"
  version "1.53.0"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-darwin-x64.tar.gz"
    sha256 "49f1ab5fb36a625865f02655e8d334ac8dea9c0b48ed2daffd3e7e347c2c16a2"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-linux-x64.tar.gz"
    sha256 "8ba875aa1bbfed5d069c3f9d2ce405983cb617ecb734811b81a2f1b3691ad9fc"
  end

  def install
    inreplace "bin/plutus", /^CLIENT_HOME=/, "export PLUTUS_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/plutus"
  end

  test do
    system bin/"plutus", "version"
  end
end
