class Plutus < Formula
  desc "plutus-cli from binaries"
  homepage "https://better.com"
  version "0.46.1"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v0.46.1/bin/darwin-x64", :using => :nounzip
    sha256 "723e8aaa2a5f1da00c97299ce1b7cf49228a6191cc0b12d796c53491acbb8a08"
    $executable_name = "darwin-x64"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v0.46.1/bin/linux-x64", :using => :nounzip
    sha256 "4f44bbfae90907ad97bbc73c696e50ad527ee326f141aa7424ab8fca69473616"
    $executable_name = "linux-x64"
  end

  def install
    mv $executable_name, name
    system "chmod", "+x", name
    libexec.install name
    bin.install_symlink libexec/name
  end

  test do
    system bin/name, "version"
  end
end
