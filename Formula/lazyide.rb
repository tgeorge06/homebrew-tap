class Lazyide < Formula
  desc "Lightweight terminal-native IDE built with Rust and ratatui"
  homepage "https://github.com/tgeorge06/lazyide"
  version "0.3.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tgeorge06/lazyide/releases/download/v0.3.7/lazyide-macos-aarch64.tar.gz"
      sha256 "460b25a7ef9f1b22a2a8af5eb2b7abe617aac63e22df20169f64ecfba2d5e1d1"
    else
      url "https://github.com/tgeorge06/lazyide/releases/download/v0.3.7/lazyide-macos-x86_64.tar.gz"
      sha256 "b72f44f1eec6dc09c1ca51f84301621cc58b29e7914b66e638c49ea82898eb46"
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
