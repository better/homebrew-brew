class Plutus < Formula
  desc "plutus-cli from source"
  homepage "https://better.com"
  version "1.7.0"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-darwin-x64.tar.gz"
    sha256 "b5abb15d4a8b5bd7c390b210b517c6fec283da33ba01d74d86e00d5ae999dd35"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-linux-x64.tar.gz"
    sha256 "491368661b13920d6f7cf3c4cf33b9df875c1c4629f197f1b1f5a7ab58621e5c"
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
