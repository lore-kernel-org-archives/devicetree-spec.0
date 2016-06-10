From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: case sensitivity for devicetree node names
Date: Fri, 10 Jun 2016 13:05:24 -0700
Message-ID: <575B1D84.2010703@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=bfcfd0M/7rjQccYRjyEUyCHO8gWljClT3neks4FCbDY=;
        b=X5OUuY2cQJmhki2VocR7QN4GLGHyhDL3mNhfqrqc6rrPaxYAcsrAwWayr7LLBNye6G
         S096dSVYrwYhWGRLSAkVBAPLfLPwQrd5ua3TzOoUd5Ururais3dwVhfA6qb9ztsvOsDr
         8Twl95vZx0Cus+xUcWUP834mnrA0W7pYbZ37TUVR2/LRxW5r18KRN4hYrG2CpmX4iGCq
         T70qTvx+3Y+8Iq8AfJzIR/SvWKvb/EMRTCGMj+pKqnslD9EMHkQhPHNc+ZCwxEUiU6yy
         7IA2U0N1mGlSlTEqWdCjl+M3VXA+xziFmkY48Ygq6uCtW/PUE/Uqrf9DlkF3sBYSZtEr
         v4Mg==
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

I had assumed that devicetree node names were case sensitive. But a recent
email thread asserted that they were not, which made me curious.

dtc treats node names as case sensitive:

$ cat test_node_case_1.dts

/dts-v1/;

/ {
	node-x {
		prop_a = < 1 >;
	};
};

/ {
	node-X {
		prop_a = < 2 >;
	};
};

$ cat test_node_case_2.dts

/dts-v1/;

/ {
	node-x {
		prop_a = < 1 >;
	};
};

/ {
	node-x {
		prop_a = < 2 >;
	};
};

$ dtc -O dts test_node_case_1.dts
/dts-v1/;

/ {

	node-x {
		prop_a = <0x1>;
	};

	node-X {
		prop_a = <0x2>;
	};
};

$ dtc -O dts test_node_case_2.dts
/dts-v1/;

/ {

	node-x {
		prop_a = <0x2>;
	};
};


But the Linux kernel source code defines of_node_cmp() as:

  include/linux/of.h:

  /* Default string compare functions, Allow arch asm/prom.h to override */
  #if !defined(of_compat_cmp)
  #define of_node_cmp(s1, s2) strcasecmp((s1), (s2))

arch/sparc/include/asm/prom.h uses strcmp() instead of strcasecmp().

Examples of using of_node_cmp() to check for a node name can be found,
for example, of_find_node_by_name().

Is case insensitivity for node names a bug in the Linux kernel, or desired
for some reason?

-Frank
