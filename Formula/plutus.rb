class Plutus < Formula
  desc "plutus-cli from source"
  homepage "https://better.com"
  version "0.60.2"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-darwin-x64.tar.gz"
    sha256 "e7501aa09652d3f080eab89b7790390c05eff8def963c29833d98a79521d5e86"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-linux-x64.tar.gz"
    sha256 "dd3b375d50bb673034c3fade9f49f3a4e6b2867973628e44275cdde1e8457607"
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
