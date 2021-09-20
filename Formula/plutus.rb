class Plutus < Formula
  desc "plutus-cli from source"
  homepage "https://better.com"
  version "1.9.9"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-darwin-x64.tar.gz"
    sha256 "4645b7ad0267fe254c7a2433c3c5b9e1f16aabbf1c53f7c7ae70102c2ce42036"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-linux-x64.tar.gz"
    sha256 "be6e0d9bab29873d9b3b8d805166dc52196b2b589e22db44cf8e6963b6708d25"
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
