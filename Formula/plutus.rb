class Plutus < Formula
  desc "plutus-cli from source"
  homepage "https://better.com"
  version "1.10.2"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-darwin-x64.tar.gz"
    sha256 "3668ad6e5a460e1b30aae81693209e6dcfe46b76205c4a85992023790c84f011"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-linux-x64.tar.gz"
    sha256 "4621d01d01d1e21c09d8757b3c35a93dbe44ca38e7eb80511497a1b5db8cd69f"
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
