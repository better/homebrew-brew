class Plutus < Formula
  desc "plutus-cli from source"
  homepage "https://better.com"
  version "1.9.6"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-darwin-x64.tar.gz"
    sha256 "253941ab9fd883bf2a6f4d500faf59eda2ea27f75c47e15c16e78aab89fca6f0"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-linux-x64.tar.gz"
    sha256 "2961f76a0cd439e4809be7ddf0eaffbe681f3d56ba6736dca10629d27def1c50"
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
