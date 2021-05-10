class Plutus < Formula
  desc "plutus-cli from binaries"
  homepage "https://better.com"
  version "0.46.4"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v0.46.4/bin/darwin-x64", :using => :nounzip
    sha256 "1eac36efadd5153e8d31fe83d4e9114a9b12de658a86ad9737298d11b13ac87d"
    $executable_name = "darwin-x64"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v0.46.4/bin/linux-x64", :using => :nounzip
    sha256 "5577d0a96806f579681546ee961473cc6c0677f93f4faba0a054fe5a08e99cb1"
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
