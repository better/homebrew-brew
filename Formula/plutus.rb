class Plutus < Formula
  desc "plutus-cli from source"
  homepage "https://better.com"
  version "0.48.4"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-darwin-x64.tar.gz"
    sha256 "c1b32d53f6c969acc36a9fbc8c61b00aafd0fc8b97b616cc5e2374c6caae48d8"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-linux-x64.tar.gz"
    sha256 "6678519b07d10139b6224de174c0978c90868a2ddb4e72abfaf89ef0f45e5c03"
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
