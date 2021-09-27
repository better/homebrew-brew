class Plutus < Formula
  desc "plutus-cli from source"
  homepage "https://better.com"
  version "1.10.1"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-darwin-x64.tar.gz"
    sha256 "2d6f9d694bf1e335039ad0948b41077fb3d1262c706baf7d14869ea9ac1a10f6"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-linux-x64.tar.gz"
    sha256 "8b9984105730d5f06e02a7c63ecb473d4a93df556bae494de8aee710b0ecc623"
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
