class Autosecure < Formula
  desc "Block known bad IPs from threat feeds using iptables"
  homepage "https://github.com/vincentkoc/autosecure"
  url "https://github.com/vincentkoc/autosecure/releases/download/v2.0.1/autosecure-v2.0.1.tar.gz"
  sha256 "17e0d68394018439c166422b8a5800d791df2671441992dc2ab470bc1594229e"
  license "GPL-3.0"
  version "2.0.1"

  depends_on "bash"

  def install
    bin.install "autosecure.sh" => "autosecure"
    doc.install "README.md", "LICENSE.md"
  end
end
