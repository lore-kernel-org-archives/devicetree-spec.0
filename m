From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Virtualization difficulty -- phandles
Date: Mon, 24 Jul 2017 10:09:48 -0700
Message-ID: <597629DC.5060800@gmail.com>
References: <ok4f5h$qg1$1@blaine.gmane.org>
 <180baf3e-9e7b-c791-3be2-81d807b14759@gmail.com>
 <ok6su1$pdq$1@blaine.gmane.org>
 <4594fc97-9b9f-267e-ee8e-8cbe89341fe7@gmail.com>
 <20170716053548.GL17539@umbus.fritz.box>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=e62/jkZ4gVxqSLB5M8His1vFHDTrj6iwU80rBbspoWk=;
        b=NVgiGFU0rvnD5O/H2bmkWvgZQ2jp9UxyNYKXPSms88BuTwUpbu9kzdqzEmlnrJ1ooK
         RE3mKpa+KSC5Wdw6fhaWLhLTzxVe3pci0ajxqv2vj7bzXbU6CYrcZD4H0foGUol5Xbyc
         9eQRGeFKlmC4ruiW7DonyH6STdAQUBvlbGb1HBOeNAgBfK4CXVTi1/MlDWO2vSr5Dmke
         ESW/CMFO0zq95ov7Qk4DMNEsoS88KRnCNfrjrgGTAg/JdGErFv9OnZQKjuMIMEEe2oNq
         5HqvAIiSqvFpBHFw0CQGPx6X4E3ItwYV99I+ZchJTYMVnwsQzTPUJVReY4z2uD7tNd4W
         GDUw==
In-Reply-To: <20170716053548.GL17539-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Cyril Novikov <cnovikov-wte42BQEg7M@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>

Hi David,

(Adding Pantelis and Tom, since I'm going somewhat off-topic from
the original thread, and they are impacted by what I am asking.)

On 07/15/17 22:35, David Gibson wrote:
> On Thu, Jul 13, 2017 at 09:47:01AM -0700, Florian Fainelli wrote:
>> On 07/12/2017 09:23 PM, Cyril Novikov wrote:
>>> On 7/12/2017 10:10 AM, Florian Fainelli wrote:
>>>> On 07/11/2017 11:15 PM, Cyril Novikov wrote:
>>>>> Hi, all!
>>>>>

< snip >

>   The
> phandle fixup information goes into the special __local_fixups__ and
> __fixups__ nodes (which have gratuitiously different format, but
> that's a rant for elsewhere).

< snip >

And in another email, David describes the __local_fixups__ format
nicely, so I'll just copy that here instead of re-inventing it:


> Well, I don't want to invent a new encoding if we can possibly avoid
> it.  The current encoding used for overlay generation looks like this
> 
> / {
> 	target: node@0 {
> 	};
> 	node@1 {
> 		ref = <&target>;
> 	};
> 	__local_fixups__ = {
> 		node@1 {
> 			ref = <0>;
> 		};
> 	};
> };
> 
> Basically, __local_fixups__  has a subtree which paralells the main
> tree.  Each property found under __local_fixups__ is a list of offsets
> at which phandle references appear in the corresponding property in
> the main tree.

I share your desire to rant about the different formats between
__local_fixups__ and __fixups__.  But I have not come up with an
alternate format for __local_fixups__ that makes me happy.  The
best format that I have come up with so far would be:

/ {
	target: node@0 {
	};
	node@1 {
		ref = <&target>;
                ref2 = <&target 42 &target_2>;
	};
        target_2: node@2 {
        };
	__local_fixups__ = {
		x1 = <"node@1/ref" 0>;
                x2 = <"node@1/ref2" 0 8>;
		};
	};
};

x1 and x2 are abitrary property names.
The format of each __local_fixups__ property is
   - path of property referencing a phandle
   - list of offsets of the phandle in the property

As another alternative, Grant was thinking about adding
a new block to the FDT format to contain the phandle
information.  That would remove the need to come up
with a convoluted dts syntax, but adds in the problem
of bootloaders corrupting the new block if they were
not aware of it.  He had thoughts about versioning
and checksums to detect the corruption it if did
occur.

If we were starting from scratch, do you have any other
approach that might be fruitful?  It seems like maybe
I am missing something that requires thinking outside
the box.

-Frank
