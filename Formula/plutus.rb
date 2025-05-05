class Plutus < Formula
  desc "plutus-cli from source"
  homepage "https://better.com"
  version "2.1.2"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-darwin-x64.tar.gz"
    sha256 "96819d4ec8b8074f02f24c5b59af3f3eebb2298f1b3723b9fee80771f4e4373d"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-linux-x64.tar.gz"
    sha256 "d005a4247c87018d653e5ad84598ccfdf4219c1f1337d2ed0ff84634b3d1c733"
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
