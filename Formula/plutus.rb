class Plutus < Formula
  desc "plutus-cli from source"
  homepage "https://better.com"
  version "2.0.0"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-darwin-x64.tar.gz"
    sha256 "5b824ca4612e73abe994f10b35448e78def2a21ebbf516dc8d14cfa69a711073"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-linux-x64.tar.gz"
    sha256 "d49f5121c5c93ba187619a98e6f642a6fcce3a0527fbc0ae9e3895640d8e99a7"
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
