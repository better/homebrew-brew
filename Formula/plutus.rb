class Plutus < Formula
  desc "plutus-cli from source"
  homepage "https://better.com"
  version "1.1.0"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-darwin-x64.tar.gz"
    sha256 "0d1630ee41573b9159c6426ad3f2a68d9bf8b13150663955ef70510b4d0c893d"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-linux-x64.tar.gz"
    sha256 "4321f03025cb3d24f8f2361c6c11fdbd4fc906d3791a69131ed2ff8c87e462e3"
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
