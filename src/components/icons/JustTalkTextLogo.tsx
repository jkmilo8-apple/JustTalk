import React from "react";

const JustTalkTextLogo = ({
  width,
  height,
  className,
}: {
  width?: number;
  height?: number;
  className?: string;
}) => {
  return (
    <svg
      width={width}
      height={height}
      className={className}
      viewBox="0 0 640 160"
      fill="none"
      xmlns="http://www.w3.org/2000/svg"
    >
      <defs>
        <linearGradient id="jt-grad" x1="0%" y1="0%" x2="100%" y2="100%">
          <stop offset="0%" stopColor="#00E5A0" />
          <stop offset="100%" stopColor="#7C3AED" />
        </linearGradient>
      </defs>
      <g transform="translate(20, 10)">
        {/* J monogram icon */}
        <rect x="0" y="20" width="44" height="44" rx="10" fill="url(#jt-grad)" />
        <text x="22" y="50" textAnchor="middle" fill="#0A0A0F" fontFamily="monospace" fontSize="28" fontWeight="bold" fontStyle="italic">J</text>
        <text x="34" y="50" textAnchor="middle" fill="#0A0A0F" fontFamily="monospace" fontSize="28" fontWeight="bold">T</text>
      </g>
      {/* Audio wave accent lines */}
      <g transform="translate(80, 52)" stroke="url(#jt-grad)" strokeWidth="3" strokeLinecap="round">
        <line x1="0" y1="12" x2="0" y2="-12" opacity="0.3" />
        <line x1="8" y1="18" x2="8" y2="-18" opacity="0.5" />
        <line x1="16" y1="24" x2="16" y2="-24" opacity="0.7" />
        <line x1="24" y1="15" x2="24" y2="-15" opacity="0.5" />
        <line x1="32" y1="8" x2="32" y2="-8" opacity="0.3" />
      </g>
      {/* JustTalk text */}
      <text x="130" y="62" fill="#F0F0F5" fontFamily="system-ui, -apple-system, sans-serif" fontSize="36" fontWeight="800" letterSpacing="-1">
        Just
        <tspan fill="url(#jt-grad)" fontWeight="900">Talk</tspan>
      </text>
      {/* Tagline subtitle */}
      <text x="130" y="88" fill="#8888A0" fontFamily="monospace" fontSize="11" letterSpacing="3">
        DICTA TUS PROMPTS · PROGRAMA CON IA
      </text>
    </svg>
  );
};

export default JustTalkTextLogo;
