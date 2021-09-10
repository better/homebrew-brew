class Plutus < Formula
  desc "plutus-cli from source"
  homepage "https://better.com"
  version "1.8.1"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-darwin-x64.tar.gz"
    sha256 "615ed4ca3d4f58f20311859bf4fa0eb09d75d3b1fac8f0fa818de665106e8a1e"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-linux-x64.tar.gz"
    sha256 "e7dfdec4c4268f89bd3f77e396be7ca8baa186cff2ae0030546e7c7238f86145"
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
