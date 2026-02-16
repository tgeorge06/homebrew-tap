class Lazyide < Formula
  desc "Lightweight terminal-native IDE built with Rust and ratatui"
  homepage "https://github.com/tgeorge06/lazyide"
  version "0.3.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tgeorge06/lazyide/releases/download/v0.3.4/lazyide-macos-aarch64.tar.gz"
      sha256 "d9a75417523a46eb7b5f69de09008791d328263593f4167bdec20178ccc6a6e0"
    else
      url "https://github.com/tgeorge06/lazyide/releases/download/v0.3.4/lazyide-macos-x86_64.tar.gz"
      sha256 "4e2af09b6567cf0b0d34d41b5a0321f7a0dd7e8143aea2dd7a6dc732e9fae72e"
    end
  end

  def install
    bin.install "lazyide"
  end

  def caveats
    <<~EOS
      Optional tools for full functionality:
        brew install ripgrep        # project-wide search (Ctrl+Shift+F)
        rustup component add rust-analyzer  # LSP for Rust files

      Run `lazyide --setup` to check and install missing tools.
    EOS
  end

  test do
    assert_match "Usage: lazyide", shell_output("#{bin}/lazyide --help")
  end
end
