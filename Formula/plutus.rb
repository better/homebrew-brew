class Plutus < Formula
  desc "plutus-cli from source"
  homepage "https://better.com"
  version "0.57.9"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-darwin-x64.tar.gz"
    sha256 "14e385ec6c51ddab86183aac7d83548a0f6f540e324af7e0f2262e828b2c6951"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-linux-x64.tar.gz"
    sha256 "fd85eef50f5c5fb1dcfa3d0aa83233bba9ac465945ed601adbfeb5d73cbe8384"
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
