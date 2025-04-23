class Plutus < Formula
  desc "plutus-cli from source"
  homepage "https://better.com"
  version "2.1.1"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-darwin-x64.tar.gz"
    sha256 "e4872117be3c9946f9351c6932a5e5991adfc00bf75d6fe9e134b79e4577e806"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-linux-x64.tar.gz"
    sha256 "846e63d43b9ff6b9d59000e07968a30ee37cbf156d1c6382a0db3e29255c80cc"
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
