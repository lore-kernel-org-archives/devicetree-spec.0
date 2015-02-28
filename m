From: Stefan Seefeld <stefan-qD8j1LwMmJjtCj0u4l0SBw@public.gmane.org>
Subject: Formal grammar for DTS
Date: Sat, 28 Feb 2015 10:22:55 -0500
Message-ID: <54F1DD4F.3080304@codesourcery.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Hello,

I would like to write a tool / library that allows me to
(programmatically) edit .dts files, with the ability to regenerate the
source files, preserving the original formatting (including comments and
other non-semantic content).

To that end I need a formal definition of the DTS grammar. While I have
found the dtc tool, all its source files (in particular the dtc-lexer.l
and dtc-parser.y files) are released under GPL, so it isn't entirely
clear whether I may use the grammar encoded in those and transcribe that
into my own (I'm writing my tool in Java, most likely using the JavaCC
parser generator tool).

So, is there another place where the grammar of Device Tree source files
is formally defined in ways that allows tools developers to use that ?
Any help and advice would be highly appreciated.

Thanks,

		Stefan


-- 
Stefan Seefeld
CodeSourcery / Mentor Embedded
stefan-qD8j1LwMmJjtCj0u4l0SBw@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree-spec" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
