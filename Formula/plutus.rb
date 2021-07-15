class Plutus < Formula
  desc "plutus-cli from source"
  homepage "https://better.com"
  version "0.57.1"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-darwin-x64.tar.gz"
    sha256 "2e670271f60f9b2578a4beda2788e6681ffcffe8ea43e571267e94a91f697118"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-linux-x64.tar.gz"
    sha256 "70270ef5a0fdb0c3a117afbb27df2cc93efead02e1ef10ed0373078062ea63e1"
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
