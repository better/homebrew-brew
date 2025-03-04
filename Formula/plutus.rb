class Plutus < Formula
  desc "plutus-cli from source"
  homepage "https://better.com"
  version "1.51.0"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-darwin-x64.tar.gz"
    sha256 "ff0cd2a90fde3df55b6da0521350e9319c95b7d2920e763ab563ee8e699a3f8b"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-linux-x64.tar.gz"
    sha256 "b8e7a33df80b05ca6799518713f3f73b4ec320d1dbcdcf6e547649e11cb875fd"
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
