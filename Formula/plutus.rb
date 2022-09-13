class Plutus < Formula
  desc "plutus-cli from source"
  homepage "https://better.com"
  version "1.32.0"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-darwin-x64.tar.gz"
    sha256 "fbf43ff1b4b3f486dbb05d884c40ea3e93b06230392982141b2b60414fbfa0e7"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-linux-x64.tar.gz"
    sha256 "9de72500fd62fcfb1b970957994896a20fb8264e3b91f06c6a72714517c4d7e3"
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
