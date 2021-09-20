class Plutus < Formula
  desc "plutus-cli from source"
  homepage "https://better.com"
  version "1.9.7"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-darwin-x64.tar.gz"
    sha256 "8dda4daf0daf301ae28b23a383b49bfe7310200759f6781ba2fc7576d03f37e9"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-linux-x64.tar.gz"
    sha256 "0adfad0b7329e7efbae519b0f6bc7cf8cf66d9f2e2021b27eab93a2957daaaf6"
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
